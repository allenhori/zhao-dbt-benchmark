select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 * 2 as v1,
    p.v1 - p.v5 as v2,
    p.v1 * 11 as v3,
    coalesce(p.v1, 0) + 2 as v4,
    p.v5 + 2 as v5,
    case when p.v1 > 1100 then p.v1 else 0 end as v6
from {{ ref('int_ev_0018') }} as p
where p.customer_id % 97 <> 0
