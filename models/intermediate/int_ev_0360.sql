select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 - p.v4 as v1,
    p.v1 * 7 as v2,
    p.v1 + 7 as v3,
    p.v4 * 11 as v4,
    p.v1 * 5 as v5,
    p.v3 + 2 as v6,
    case when p.v1 > p.v3 then p.v1 else p.v3 end as v7
from {{ ref('int_ev_0004') }} as p
where p.customer_id % 97 <> 0
