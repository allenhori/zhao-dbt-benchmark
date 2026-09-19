select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v1, 0) + 5 as v1,
    p.v6 + 7 as v2,
    case when p.v1 > p.v7 then p.v1 else p.v7 end as v3,
    case when p.v6 > p.v7 then p.v6 else p.v7 end as v4,
    coalesce(p.v6, 0) + 5 as v5,
    case when p.v1 > p.v7 then p.v1 else p.v7 end as v6,
    round(p.v7 / 7.0, 4) as v7
from {{ ref('int_ev_0025') }} as p
