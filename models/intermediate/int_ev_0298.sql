select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 * 11 as v1,
    case when p.v4 > 300 then p.v4 else 0 end as v2,
    p.v3 * 2 as v3,
    case when p.v2 > 300 then p.v2 else 0 end as v4,
    coalesce(p.v3, 0) + 3 as v5,
    p.v4 * 0.5 + p.v2 * 0.5 as v6
from {{ ref('int_ev_0012') }} as p
where p.customer_id % 97 <> 0
