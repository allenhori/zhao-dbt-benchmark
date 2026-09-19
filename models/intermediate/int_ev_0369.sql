select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v1 * 11 as v1,
    p.v5 * 13 as v2,
    p.v5 * 13 as v3,
    case when p.v5 > 1100 then p.v5 else 0 end as v4,
    p.v5 + 2 as v5,
    p.v5 * 11 as v6,
    p.v1 - p.v5 as v7,
    p.v3 + 7 as v8
from {{ ref('int_ev_0231') }} as p
where p.customer_id % 97 <> 0
