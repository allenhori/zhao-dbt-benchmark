select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v6 / 2.0, 4) as v1,
    case when p.v6 > 700 then p.v6 else 0 end as v2,
    p.v1 + p.v6 as v3,
    coalesce(p.v2, 0) + 3 as v4,
    coalesce(p.v2, 0) + 11 as v5,
    p.v6 * 3 as v6,
    case when p.v2 > 300 then p.v2 else 0 end as v7
from {{ ref('int_ev_0012') }} as p
where p.customer_id % 97 <> 0
