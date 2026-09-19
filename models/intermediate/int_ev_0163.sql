select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 * 11 as v1,
    case when p.v6 > p.v3 then p.v6 else p.v3 end as v2,
    p.v3 + 13 as v3,
    p.v3 - p.v6 as v4,
    p.v3 * 7 as v5,
    round(p.v3 / 13.0, 4) as v6,
    p.v6 - p.v3 as v7
from {{ ref('int_ev_0083') }} as p
