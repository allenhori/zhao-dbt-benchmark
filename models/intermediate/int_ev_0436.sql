select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v4 + p.v2 as v1,
    case when p.v4 > 1300 then p.v4 else 0 end as v2,
    p.v2 * 2 as v3,
    p.v2 * 13 as v4,
    case when p.v4 > p.v2 then p.v4 else p.v2 end as v5,
    coalesce(p.v4, 0) + 7 as v6,
    case when p.v2 > p.v4 then p.v2 else p.v4 end as v7
from {{ ref('int_ev_0028') }} as p
where p.customer_id % 97 <> 0
