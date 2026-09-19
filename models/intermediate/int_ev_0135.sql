select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v4 + 5 as v1,
    p.v4 - p.v6 as v2,
    p.v4 * 2 as v3,
    p.v6 * 11 as v4,
    case when p.v6 > 500 then p.v6 else 0 end as v5,
    round(p.v6 / 11.0, 4) as v6
from {{ ref('int_ev_0030') }} as p
