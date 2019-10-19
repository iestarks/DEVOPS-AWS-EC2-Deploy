node {
    step([
        $class: 'ExecuteDslScripts',
        scriptText: 'job("example-2")'
    ])
    step([
        $class: 'ExecuteDslScripts',
        targets: ['jobs/projectA/*.groovy', 'jobs/common.groovy'].join('\n'),
        removedJobAction: 'DELETE',
        removedViewAction: 'DELETE',
        lookupStrategy: 'SEED_JOB',
        additionalClasspath: ['libA.jar', 'libB.jar'].join('\n'),
        additionalParameters: [message: 'Hello from pipeline', credentials: 'SECRET']
    ])
}
