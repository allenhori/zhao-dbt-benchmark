select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v2 / 13.0, 4) as v1,
    p.v1 * 5 as v2,
    case when p.v2 > 700 then p.v2 else 0 end as v3,
    coalesce(p.v2, 0) + 11 as v4,
    p.v2 - p.v1 as v5,
    p.v1 + p.v2 as v6,
    p.v3 + 7 as v7
from {{ ref('int_ev_0005') }} as p
where p.customer_id % 97 <> 0
