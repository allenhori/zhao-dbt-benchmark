select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v1, 0) + 11 as v1,
    p.v6 + 13 as v2,
    round(p.v1 / 7.0, 4) as v3,
    p.v2 + p.v6 as v4,
    p.v2 * 0.5 + p.v1 * 0.5 as v5,
    p.v6 + p.v2 as v6,
    case when p.v1 > 200 then p.v1 else 0 end as v7
from {{ ref('int_ev_0016') }} as p
