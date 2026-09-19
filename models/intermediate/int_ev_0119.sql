select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v7 * 2 as v1,
    p.v7 * 0.5 + p.v4 * 0.5 as v2,
    coalesce(p.v7, 0) + 11 as v3,
    round(p.v4 / 3.0, 4) as v4,
    p.v7 * 0.5 + p.v4 * 0.5 as v5,
    case when p.v4 > 200 then p.v4 else 0 end as v6,
    round(p.v4 / 11.0, 4) as v7
from {{ ref('int_ev_0010') }} as p
