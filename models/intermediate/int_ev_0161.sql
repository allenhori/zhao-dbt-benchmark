select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v6 > 200 then p.v6 else 0 end as v1,
    p.v3 * 0.5 + p.v6 * 0.5 as v2,
    round(p.v1 / 5.0, 4) as v3,
    p.v3 + 3 as v4,
    case when p.v3 > p.v1 then p.v3 else p.v1 end as v5,
    round(p.v3 / 13.0, 4) as v6,
    round(p.v6 / 5.0, 4) as v7
from {{ ref('int_ev_0040') }} as p
