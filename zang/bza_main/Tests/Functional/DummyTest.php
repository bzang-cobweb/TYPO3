<?php

namespace Zang\BzaMain\Tests\Functional;

use TYPO3\CMS\Core\Domain\Repository\PageRepository;
use TYPO3\CMS\Core\Utility\ExtensionManagementUtility;
use TYPO3\CMS\Core\Utility\GeneralUtility;
use TYPO3\CMS\Extbase\Object\ObjectManager;
use TYPO3\TestingFramework\Core\Functional;

/**
 * This is just a simple test to illustrate a functional test
 * Class DummyTest
 */
class DummyTest extends Functional\FunctionalTestCase
{
    /**
     * @var array Have styleguide loaded
     */
    protected $testExtensionsToLoad = [
        'typo3conf/ext/bza_main',
    ];


    public function setUp(): void
    {
        parent::setUp();
        $this->setUpBackendUserFromFixture(1);
        $this->importDataSet(ExtensionManagementUtility::extPath('bza_main') . 'Tests/Fixtures/DummyTest.xml');
    }

    /**
     * @test
     */
    public function someUselessTest() {
        /** @var ObjectManager $objectManager */
        $objectManager = GeneralUtility::makeInstance(ObjectManager::class);
        /** @var PageRepository $pageRepository */
        $pageRepository = $objectManager->get(PageRepository::class);

        $page = $pageRepository->getPage(1);
        $this->assertSame(1, $page['uid']);
    }
}
