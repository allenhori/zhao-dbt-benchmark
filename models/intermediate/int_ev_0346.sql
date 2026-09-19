select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v4 / 2.0, 4) as v1,
    p.v7 * 7 as v2,
    case when p.v4 > 1100 then p.v4 else 0 end as v3,
    p.v7 + 13 as v4,
    coalesce(p.v4, 0) + 7 as v5,
    p.v7 * 13 as v6,
    case when p.v3 > 200 then p.v3 else 0 end as v7,
    coalesce(p.v3, 0) + 3 as v8
from {{ ref('int_ev_0132') }} as p
where p.customer_id % 97 <> 0
