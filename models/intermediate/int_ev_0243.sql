select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v2 - p.v8 as v1,
    p.v1 + 13 as v2,
    p.v2 + 11 as v3,
    p.v8 - p.v2 as v4,
    p.v2 * 0.5 + p.v8 * 0.5 as v5,
    p.v8 + 7 as v6
from {{ ref('int_ev_0200') }} as p
where p.customer_id % 97 <> 0
