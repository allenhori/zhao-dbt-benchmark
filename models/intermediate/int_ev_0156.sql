select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v5 > 1300 then p.v5 else 0 end as v1,
    case when p.v5 > 1100 then p.v5 else 0 end as v2,
    case when p.v2 > p.v5 then p.v2 else p.v5 end as v3,
    p.v2 * 0.5 + p.v5 * 0.5 as v4,
    round(p.v5 / 2.0, 4) as v5,
    p.v2 * 0.5 + p.v5 * 0.5 as v6
from {{ ref('int_ev_0009') }} as p
