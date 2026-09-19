select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v4 - p.v2 as v1,
    coalesce(p.v3, 0) + 3 as v2,
    case when p.v2 > p.v3 then p.v2 else p.v3 end as v3,
    p.v2 + p.v4 as v4,
    round(p.v4 / 3.0, 4) as v5,
    case when p.v3 > p.v4 then p.v3 else p.v4 end as v6,
    case when p.v4 > p.v2 then p.v4 else p.v2 end as v7
from {{ ref('int_ev_0003') }} as p
