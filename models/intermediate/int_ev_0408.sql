select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v8, 0) + 2 as v1,
    p.v6 - p.v8 as v2,
    p.v1 * 0.5 + p.v8 * 0.5 as v3,
    p.v1 * 11 as v4,
    p.v8 + 2 as v5,
    p.v6 + p.v1 as v6
from {{ ref('int_ev_0002') }} as p
where p.customer_id % 97 <> 0
