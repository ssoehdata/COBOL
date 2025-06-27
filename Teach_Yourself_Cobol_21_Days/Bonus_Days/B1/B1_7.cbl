      * Multilevel Control Breaks
      * A general logic flow for control breaks.

       process-the-file
           perform start-the-file
           perform process-level-1-control-break 
       start-the-file
           create-the-file
           open the file
       create-the-file
           sort the file on
           level-2-control-field
           level-3-control-field
           level-4-control-field
       end-the-file
           close the file
           process-level-1-control-break
           perform start-level-1
           perform process-level-2-control-break
           until file-at-end
           perform end-level-1
       start-level-1
           read first valid record
           move zeroes to level-1-accumulators
           any other starting actions
       end-level-1
           perform process-level-1-accumulators
           any other ending actions
       process-level-2-control-break
           perform start-level-2
           perform process-level-3-control-break
           until file-at-end
           or level-2-control-field not = level-2-current-value
           perform end-level-2
       start-level-2
           move level-2-control-field to level-2-current-value
           move zeroes to level-2-accumulators
           any other starting actions
       end-level-2
           perform process-level-2-accumulators
           perform add-level-2-accumulators to level-1-accumulators
           any other ending actions
       process-level-3-control-break
           perform start-level-3
           perform process-level-4-control-break
           until file-at-end
           or level-2-control-field not = level-2-current-value
           or level-3-control-field not = level-3-current-value
           perform end-level-3
       start-level-3
           move level-3-control-field to level-3-current-value
           move zeroes to level-3-accumulators
           any other starting actions
       end-level-3
           perform process-level-3-accumulators
           perform add-level-3-accumulators to level-2-accumulators
           any other ending actions
       process-level-4-control-break
           perform start-level-4
           perform process-one-record
           until file-at-end
           or level-2-control-field not = level-2-current-value
           or level-3-control-field not = level-3-current-value
           or level-4-control-field not = level-4-current-value
           perform end-level-4
       start-level-4
           move level-4-control-field to level-4-current-value
           move zeroes to level-4-accumulators
           any other starting actions
       end-level-4
           perform process-level-4-accumulators
           perform add-level-4-accumulators to level-3-accumulators
           any other ending actions
       process-one-record
           perform process-this-record
           add record-values to level-4-accumulators
           read next valid record
