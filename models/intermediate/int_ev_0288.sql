select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v3 > 1300 then p.v3 else 0 end as v1,
    case when p.v3 > p.v4 then p.v3 else p.v4 end as v2,
    coalesce(p.v3, 0) + 11 as v3,
    case when p.v3 > 300 then p.v3 else 0 end as v4,
    coalesce(p.v4, 0) + 7 as v5,
    round(p.v4 / 3.0, 4) as v6,
    p.v4 - p.v3 as v7
from {{ ref('int_ev_0012') }} as p
