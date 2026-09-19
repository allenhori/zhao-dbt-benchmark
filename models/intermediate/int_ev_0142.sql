select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 + 3 as v1,
    case when p.v5 > p.v6 then p.v5 else p.v6 end as v2,
    p.v5 + 7 as v3,
    p.v5 + p.v3 as v4,
    round(p.v3 / 5.0, 4) as v5,
    p.v3 * 13 as v6,
    case when p.v3 > p.v5 then p.v3 else p.v5 end as v7
from {{ ref('int_ev_0111') }} as p
