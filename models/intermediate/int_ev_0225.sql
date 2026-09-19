select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v1 > 300 then p.v1 else 0 end as v1,
    coalesce(p.v3, 0) + 11 as v2,
    round(p.v1 / 13.0, 4) as v3,
    round(p.v1 / 3.0, 4) as v4,
    case when p.v6 > p.v1 then p.v6 else p.v1 end as v5,
    coalesce(p.v1, 0) + 3 as v6,
    p.v1 - p.v6 as v7
from {{ ref('int_ev_0117') }} as p
