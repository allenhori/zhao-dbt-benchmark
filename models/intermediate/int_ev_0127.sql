select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 * 2 as v1,
    p.v3 - p.v5 as v2,
    round(p.v5 / 7.0, 4) as v3,
    p.v5 + 7 as v4,
    case when p.v3 > 500 then p.v3 else 0 end as v5,
    coalesce(p.v3, 0) + 2 as v6,
    p.v5 * 3 as v7
from {{ ref('int_ev_0015') }} as p
