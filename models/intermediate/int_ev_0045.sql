select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v1 + 11 as v1,
    case when p.v1 > p.v3 then p.v1 else p.v3 end as v2,
    p.v1 * 7 as v3,
    case when p.v1 > 300 then p.v1 else 0 end as v4,
    round(p.v3 / 2.0, 4) as v5,
    round(p.v3 / 13.0, 4) as v6
from {{ ref('int_ev_0029') }} as p
