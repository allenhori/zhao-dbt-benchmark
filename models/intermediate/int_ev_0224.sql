select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v2, 0) + 7 as v1,
    case when p.v6 > 200 then p.v6 else 0 end as v2,
    coalesce(p.v7, 0) + 13 as v3,
    case when p.v7 > p.v6 then p.v7 else p.v6 end as v4,
    p.v7 * 7 as v5,
    coalesce(p.v6, 0) + 3 as v6,
    coalesce(p.v7, 0) + 13 as v7
from {{ ref('int_ev_0058') }} as p
where p.customer_id % 97 <> 0
