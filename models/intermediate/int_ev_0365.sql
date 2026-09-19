select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v7 > 300 then p.v7 else 0 end as v1,
    case when p.v7 > p.v3 then p.v7 else p.v3 end as v2,
    coalesce(p.v7, 0) + 13 as v3,
    round(p.v3 / 11.0, 4) as v4,
    p.v3 - p.v7 as v5,
    case when p.v7 > 700 then p.v7 else 0 end as v6,
    p.v3 - p.v7 as v7
from {{ ref('int_ev_0016') }} as p
