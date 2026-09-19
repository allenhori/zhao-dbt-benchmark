select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v5 > p.v4 then p.v5 else p.v4 end as v1,
    p.v1 * 7 as v2,
    case when p.v4 > p.v1 then p.v4 else p.v1 end as v3,
    p.v5 + 7 as v4,
    p.v5 * 0.5 + p.v4 * 0.5 as v5,
    round(p.v1 / 3.0, 4) as v6
from {{ ref('int_ev_0001') }} as p
