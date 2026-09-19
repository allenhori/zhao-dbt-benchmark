select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v2, 0) + 13 as v1,
    coalesce(p.v1, 0) + 11 as v2,
    p.v2 * 0.5 + p.v1 * 0.5 as v3,
    p.v6 + 11 as v4,
    p.v2 * 7 as v5,
    p.v2 - p.v6 as v6
from {{ ref('int_ev_0008') }} as p
where p.customer_id % 97 <> 0
