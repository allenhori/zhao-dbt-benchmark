select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v4 > 1300 then p.v4 else 0 end as v1,
    p.v4 * 0.5 + p.v6 * 0.5 as v2,
    p.v4 + 7 as v3,
    case when p.v4 > 500 then p.v4 else 0 end as v4,
    p.v4 + p.v6 as v5,
    round(p.v4 / 3.0, 4) as v6
from {{ ref('int_ev_0022') }} as p
