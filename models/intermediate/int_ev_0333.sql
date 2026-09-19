select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v7 > 1300 then p.v7 else 0 end as v1,
    p.v2 + 5 as v2,
    round(p.v2 / 5.0, 4) as v3,
    case when p.v7 > 500 then p.v7 else 0 end as v4,
    round(p.v7 / 3.0, 4) as v5,
    p.v2 + p.v7 as v6,
    coalesce(p.v2, 0) + 5 as v7
from {{ ref('int_ev_0025') }} as p
