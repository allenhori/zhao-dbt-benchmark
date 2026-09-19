select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v7 / 7.0, 4) as v1,
    case when p.v7 > 1300 then p.v7 else 0 end as v2,
    p.v4 * 0.5 + p.v5 * 0.5 as v3,
    p.v7 * 3 as v4,
    coalesce(p.v5, 0) + 5 as v5,
    p.v4 * 13 as v6
from {{ ref('int_ev_0046') }} as p
