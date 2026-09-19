select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 + 13 as v1,
    round(p.v1 / 7.0, 4) as v2,
    p.v1 - p.v3 as v3,
    coalesce(p.v4, 0) + 13 as v4,
    case when p.v3 > 200 then p.v3 else 0 end as v5,
    case when p.v4 > 1300 then p.v4 else 0 end as v6,
    p.v1 + p.v4 as v7
from {{ ref('int_ev_0008') }} as p
