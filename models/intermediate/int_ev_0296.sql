select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v1, 0) + 5 as v1,
    p.v1 * 7 as v2,
    p.v5 + 7 as v3,
    case when p.v1 > p.v5 then p.v1 else p.v5 end as v4,
    p.v5 + p.v1 as v5,
    p.v1 + p.v2 as v6,
    case when p.v5 > 700 then p.v5 else 0 end as v7
from {{ ref('int_ev_0023') }} as p
where p.customer_id % 97 <> 0
