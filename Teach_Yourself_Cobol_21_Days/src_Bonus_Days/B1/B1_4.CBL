      * PSEUDOCODE FOR A A LEVEL-1 CONTROL BREAK
      process-level-1-control-break
           perform start-level-1
           perform process-level-2-control-break
           until file-at-end
           perform end-level-1
       start-level-1
           read first valid record
           move zeroes to level-1-accumulators.
           any other starting actions
       end-level-1
           perform process-level-1-accumulators
           any other ending actions