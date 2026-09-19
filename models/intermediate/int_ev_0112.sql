select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v4 * 0.5 + p.v6 * 0.5 as v1,
    coalesce(p.v6, 0) + 7 as v2,
    round(p.v6 / 2.0, 4) as v3,
    case when p.v6 > p.v1 then p.v6 else p.v1 end as v4,
    case when p.v6 > p.v1 then p.v6 else p.v1 end as v5,
    p.v6 * 3 as v6
from {{ ref('int_ev_0042') }} as p
