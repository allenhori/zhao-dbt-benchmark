select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v4 + 11 as v1,
    case when p.v1 > p.v4 then p.v1 else p.v4 end as v2,
    case when p.v4 > p.v6 then p.v4 else p.v6 end as v3,
    round(p.v4 / 2.0, 4) as v4,
    round(p.v6 / 2.0, 4) as v5,
    p.v6 * 13 as v6
from {{ ref('int_ev_0221') }} as p
