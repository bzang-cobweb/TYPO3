# Abstract repository
Helper class to easily write your query constraints

* Your repository must extends AbstractRepository
* Example of call

```
findBy([
    'uids' => [1,2,3]]
)
```

* Write your own constraint. Example just add method typeConstraint in your repository

```
typeConstraint($query, $criteria) in your repository class
findBy([
    'uids' => [1,2,3], 
    'type' => 2]
)
```

* Ignore some enable fields. You can passed array or string: 'deleted,hidden'

```
findBy([
    'uids' => [1,2,3], 
    'type' => 2, 
    'ignoreFields' => true]
)
```

The above example ignore all enabled fields and deleted field

```
findBy([
    'uids' => [1,2,3], 
    'type' => 2, 
    'ignoreFields' => 'deleted,hidden,starttime']
)
```

The above example ignore all given enabled fields
 