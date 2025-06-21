      * PSEUDODCODE FOR A CONTROL BREAK
       process-level-2-control-break
           perform start-level-2-control-break
           perform process-level-3-control-break
           until file at end
           or level-2-control-field not = level-2-current-value
           perform end-level-2
       start-level-2
           move level-2-control-field to level-2-current-value.
           move zeroes to level-2 accumulators.
           any other starting actions
       end-level-2
           perform process-level-2-accumulators
           perform add-level-2 accumulators to level-1 accumulators
           any other ending actions