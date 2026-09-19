select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v6 / 2.0, 4) as v1,
    p.v6 + p.v3 as v2,
    case when p.v1 > 700 then p.v1 else 0 end as v3,
    case when p.v1 > p.v6 then p.v1 else p.v6 end as v4,
    case when p.v1 > 1100 then p.v1 else 0 end as v5,
    round(p.v1 / 3.0, 4) as v6,
    case when p.v6 > p.v3 then p.v6 else p.v3 end as v7,
    p.v1 + p.v6 as v8
from {{ ref('int_ev_0157') }} as p
