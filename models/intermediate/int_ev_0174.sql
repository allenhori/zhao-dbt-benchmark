select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v4 + 13 as v1,
    p.v4 * 5 as v2,
    p.v6 * 2 as v3,
    round(p.v4 / 7.0, 4) as v4,
    p.v6 + 11 as v5,
    case when p.v6 > 700 then p.v6 else 0 end as v6,
    p.v6 + p.v4 as v7
from {{ ref('int_ev_0032') }} as p
