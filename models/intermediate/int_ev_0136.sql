select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 + 13 as v1,
    coalesce(p.v5, 0) + 13 as v2,
    p.v5 * 2 as v3,
    p.v1 - p.v4 as v4,
    p.v5 + 5 as v5,
    case when p.v1 > p.v5 then p.v1 else p.v5 end as v6,
    case when p.v1 > 300 then p.v1 else 0 end as v7,
    p.v5 - p.v1 as v8
from {{ ref('int_ev_0030') }} as p
where p.customer_id % 97 <> 0
