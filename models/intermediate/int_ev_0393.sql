select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v1 * 7 as v1,
    round(p.v4 / 2.0, 4) as v2,
    p.v4 + p.v1 as v3,
    round(p.v1 / 5.0, 4) as v4,
    round(p.v1 / 3.0, 4) as v5,
    case when p.v5 > 500 then p.v5 else 0 end as v6,
    p.v1 + 5 as v7
from {{ ref('int_ev_0012') }} as p
