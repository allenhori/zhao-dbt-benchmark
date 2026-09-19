select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v4 > 300 then p.v4 else 0 end as v1,
    p.v3 * 2 as v2,
    case when p.v4 > 1100 then p.v4 else 0 end as v3,
    p.v3 + 5 as v4,
    p.v4 * 0.5 + p.v3 * 0.5 as v5,
    p.v3 * 13 as v6,
    case when p.v3 > p.v4 then p.v3 else p.v4 end as v7,
    case when p.v3 > 300 then p.v3 else 0 end as v8
from {{ ref('int_ev_0030') }} as p
where p.customer_id % 97 <> 0
