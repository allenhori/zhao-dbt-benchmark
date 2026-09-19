select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v4 * 13 as v1,
    round(p.v6 / 13.0, 4) as v2,
    p.v6 * 0.5 + p.v4 * 0.5 as v3,
    p.v6 * 5 as v4,
    case when p.v4 > 200 then p.v4 else 0 end as v5,
    round(p.v4 / 2.0, 4) as v6
from {{ ref('int_ev_0022') }} as p
