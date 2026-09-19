select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v6 > 700 then p.v6 else 0 end as v1,
    p.v3 + 3 as v2,
    round(p.v6 / 2.0, 4) as v3,
    case when p.v6 > 300 then p.v6 else 0 end as v4,
    p.v3 * 3 as v5,
    p.v6 + 7 as v6,
    case when p.v6 > p.v3 then p.v6 else p.v3 end as v7
from {{ ref('int_ev_0012') }} as p
