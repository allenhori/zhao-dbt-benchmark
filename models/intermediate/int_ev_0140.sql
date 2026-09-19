select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v2 + 3 as v1,
    p.v7 * 2 as v2,
    case when p.v7 > 500 then p.v7 else 0 end as v3,
    round(p.v2 / 11.0, 4) as v4,
    coalesce(p.v7, 0) + 13 as v5,
    coalesce(p.v5, 0) + 7 as v6,
    coalesce(p.v2, 0) + 13 as v7,
    coalesce(p.v2, 0) + 7 as v8
from {{ ref('int_ev_0001') }} as p
where p.customer_id % 97 <> 0
