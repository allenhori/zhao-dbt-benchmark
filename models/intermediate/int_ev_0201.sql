select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v2 / 11.0, 4) as v1,
    coalesce(p.v2, 0) + 11 as v2,
    case when p.v7 > 200 then p.v7 else 0 end as v3,
    case when p.v7 > 500 then p.v7 else 0 end as v4,
    p.v4 + 2 as v5,
    p.v2 + 5 as v6,
    case when p.v4 > 500 then p.v4 else 0 end as v7
from {{ ref('int_ev_0016') }} as p
