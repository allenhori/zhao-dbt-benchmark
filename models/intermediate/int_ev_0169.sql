select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v1 / 7.0, 4) as v1,
    p.v5 * 2 as v2,
    p.v2 * 11 as v3,
    coalesce(p.v2, 0) + 7 as v4,
    case when p.v5 > 1100 then p.v5 else 0 end as v5,
    p.v2 - p.v1 as v6,
    round(p.v1 / 13.0, 4) as v7,
    p.v5 * 5 as v8
from {{ ref('int_ev_0124') }} as p
where p.customer_id % 97 <> 0
