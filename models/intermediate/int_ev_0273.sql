select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 * 0.5 + p.v7 * 0.5 as v1,
    coalesce(p.v3, 0) + 13 as v2,
    case when p.v7 > 700 then p.v7 else 0 end as v3,
    p.v7 * 0.5 + p.v5 * 0.5 as v4,
    p.v7 - p.v3 as v5,
    round(p.v5 / 13.0, 4) as v6
from {{ ref('int_ev_0211') }} as p
