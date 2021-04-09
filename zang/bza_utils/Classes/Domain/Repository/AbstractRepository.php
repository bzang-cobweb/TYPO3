<?php

namespace Zang\BzaUtils\Domain\Repository;


use Exception;
use TYPO3\CMS\Extbase\Persistence\Exception\InvalidQueryException;
use TYPO3\CMS\Extbase\Persistence\Generic\Qom\AndInterface;
use TYPO3\CMS\Extbase\Persistence\Generic\QueryResult;
use TYPO3\CMS\Extbase\Persistence\Generic\QuerySettingsInterface;
use TYPO3\CMS\Extbase\Persistence\QueryInterface;
use TYPO3\CMS\Extbase\Persistence\QueryResultInterface;
use TYPO3\CMS\Extbase\Persistence\Repository;

/**
 * Helper class to easily write your query constraints
 * 1. Your repository must extends this class
 * 2. Example of call findBy(['uids' => [1,2,3] or '1,2,3'])
 * 3. Write your own constraint just add method typeConstraint($query, $criteria)
 *    and call findBy(['uids' => [1,2,3], 'type' => 2])
 *
 * Class AbstractRepository
 * @package Zang\BzaUtils\Domain\Repository
 * @author Bertrand Zang <etienne.bertrand.zang@gmail.com>
 */
class AbstractRepository extends Repository
{
    protected $defaultCriteria = [];

    /**
     * Do not include pid in queries
     */
    public function initializeObject()
    {
        /** @var QuerySettingsInterface $defaultQuerySettings */
        $defaultQuerySettings = $this->objectManager->get(QuerySettingsInterface::class);
        $defaultQuerySettings->setRespectStoragePage(false);
        $this->setDefaultQuerySettings($defaultQuerySettings);
    }

    /**
     * Allows to query the repository with a set of predefined criteria
     * Each criterion is a key/value pair, with the key specifying a repo function to call and the value simply being passed
     * to the said function.
     *
     * This allows you to create a someNameConstraint function and call it from anywhere with
     * <code>$repository->findBy([ 'someName' => value ])</code>
     *
     * If you want some constraints to apply to all findBy, findOneBy and countBy, you can set any additional constraints
     * in $defaultCriteria and these will be applied to all queries.
     * Each constraint method can return either one single constraint, or an array of constraints.
     *
     * There are also some predefined constraints you can use, such as :
     * - uid : A single uid
     * - uids : An array of possible uids
     * - limit : The query limit (can be used with offset)
     * - offset : An offset to the limit
     * - orderings : The ordering to apply.
     * - ignoreFields : An array of ignoreFields
     * - language : The language uid
     *
     * @param array $criteria
     * @return array|QueryResultInterface
     *
     * @see \TYPO3\CMS\Extbase\Persistence\Generic\QuerySettingsInterface::setIgnoreEnableFields
     * @see \TYPO3\CMS\Extbase\Persistence\Generic\QuerySettingsInterface::setLanguageUid     *
     * @see AbstractRepository::uidsConstraint()
     * @see \TYPO3\CMS\Extbase\Persistence\QueryInterface::setOrderings
     */
    public function findBy(array $criteria = [])
    {
        $query = $this->createQuery();
        $constraints = $this->constraints($query, array_merge($criteria, $this->defaultCriteria));
        if (!empty($constraints)) {
            $query->matching($query->logicalAnd($constraints));
        }

        try {
            return $query->execute();
        } catch (Exception $exception) {
            return [];
        }
    }

    /**
     * @param array $criteria
     * @return object
     *
     * @see \Zang\BzaUtils\Domain\Repository\AbstractRepository::findBy
     */
    public function findOneBy(array $criteria = [])
    {
        $results = $this->findBy($criteria);

        if ($results instanceof QueryResultInterface) {
            return $results->getFirst();
        }

        return null;
    }

    /**
     * @param array $criteria
     * @return int
     * @see \Zang\BzaUtils\Domain\Repository\AbstractRepository::findBy
     *
     */
    public function countBy(array $criteria = []): int
    {
        $results = $this->findBy($criteria);

        if ($results instanceof QueryResultInterface) {
            return $results->count();
        }

        return 0;
    }

    /**
     * @param QueryInterface $query
     * @param $criteria
     */
    protected function setLimit(QueryInterface $query, $criteria)
    {
        if ((int)$criteria['limit'] > 0) {
            $query->setLimit((int)$criteria['limit']);
        }
    }

    /**
     * @param QueryInterface $query
     * @param $criteria
     */
    protected function setOrderings(QueryInterface $query, $criteria)
    {
        if (is_array($criteria['orderings'])) {
            $query->setOrderings($criteria['orderings']);
        }
    }

    /**
     * @param QueryInterface $query
     * @param $criteria
     */
    protected function setOffset(QueryInterface $query, $criteria)
    {
        if ((int)$criteria['offset'] > 0) {
            if ((int)$criteria['limit'] === 0) {
                $query->setLimit(PHP_INT_MAX);
            }
            $query->setOffset((int)$criteria['offset']);
        }
    }

    /**
     * @param QueryInterface $query
     * @param array $criteria
     */
    protected function setIgnoreFields(QueryInterface $query, $criteria)
    {
        $ignoreFields = $criteria['ignoreFields'];
        if (is_bool($ignoreFields)) {
            if ($ignoreFields) {
                $query->getQuerySettings()->setIgnoreEnableFields(true);
                $query->getQuerySettings()->setIncludeDeleted(true);
            }
        } else {
            if (!is_array($ignoreFields)) {
                $ignoreFields = explode(',', $ignoreFields);
            }
            if (!empty($ignoreFields)) {
                $query->getQuerySettings()->setIgnoreEnableFields(true);
                $query->getQuerySettings()->setEnableFieldsToBeIgnored($ignoreFields);
                if (in_array('deleted', $ignoreFields)) {
                    $query->getQuerySettings()->setIncludeDeleted(true);
                }
            }
        }
    }

    /**
     * @param QueryInterface $query
     * @param array $criteria
     * @return AndInterface
     */
    protected function uidConstraint(QueryInterface $query, $criteria)
    {
        return $query->logicalAnd($query->equals('uid', (int)$criteria['uid']));
    }

    /**
     * @param QueryInterface $query
     * @param $criteria
     * @return AndInterface|null
     * @throws InvalidQueryException
     */
    protected function uidsConstraint(QueryInterface $query, $criteria)
    {
        $uids = $criteria['uids'];
        if (!is_array($uids)) {
            $uids = explode(',', $uids);
        }
        return $query->logicalAnd($query->in('uid', $uids));
    }

    /**
     * @param QueryInterface $query
     * @param array $criteria
     * @return AndInterface
     */
    protected function languageConstraint(QueryInterface $query, $criteria)
    {
        $this->defaultQuerySettings->setLanguageUid((int)$criteria['language']);
        $query->setQuerySettings(clone $this->defaultQuerySettings);
        return null;
    }

    /**
     * @param QueryInterface $query
     * @param array $criteria
     * @return array
     */
    protected function constraints(QueryInterface $query, array $criteria): array
    {
        $constraints = [];
        foreach ($criteria as $key => $value) {
            $method = 'set' . ucfirst($key);
            if (method_exists($this, $method)) {
                $this->$method($query, $criteria);
                continue;
            }

            $method = $key . 'Constraint';
            if (method_exists($this, $method)) {
                $constraint = $this->$method($query, $criteria);

                if (empty($constraint)) {
                    continue;
                }

                if (is_array($constraint)) {
                    $constraints = array_merge($constraints, $constraint);
                } else {
                    $constraints[] = $constraint;
                }
            }
        }
        return $constraints;
    }

    /**
     * Persist all
     */
    public function commit()
    {
        $this->persistenceManager->persistAll();
    }
}
