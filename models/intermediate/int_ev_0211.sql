select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 + 7 as v1,
    p.v2 + 5 as v2,
    p.v3 + p.v2 as v3,
    coalesce(p.v3, 0) + 3 as v4,
    coalesce(p.v3, 0) + 5 as v5,
    p.v3 * 0.5 + p.v2 * 0.5 as v6,
    p.v3 + 7 as v7
from {{ ref('int_ev_0141') }} as p
where p.customer_id % 97 <> 0
