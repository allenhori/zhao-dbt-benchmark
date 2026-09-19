select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v2 / 2.0, 4) as v1,
    p.v4 + 11 as v2,
    case when p.v2 > 500 then p.v2 else 0 end as v3,
    case when p.v2 > 1100 then p.v2 else 0 end as v4,
    case when p.v7 > 1300 then p.v7 else 0 end as v5,
    p.v7 + p.v2 as v6
from {{ ref('int_ev_0025') }} as p
