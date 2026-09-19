select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v7 / 2.0, 4) as v1,
    p.v7 + p.v6 as v2,
    case when p.v6 > 700 then p.v6 else 0 end as v3,
    case when p.v6 > 200 then p.v6 else 0 end as v4,
    case when p.v7 > 300 then p.v7 else 0 end as v5,
    round(p.v6 / 3.0, 4) as v6,
    coalesce(p.v6, 0) + 2 as v7,
    case when p.v7 > p.v6 then p.v7 else p.v6 end as v8
from {{ ref('int_ev_0083') }} as p
