select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v6 / 11.0, 4) as v1,
    p.v6 + 13 as v2,
    p.v6 + 13 as v3,
    p.v3 + p.v6 as v4,
    p.v3 + 3 as v5,
    case when p.v3 > p.v6 then p.v3 else p.v6 end as v6
from {{ ref('int_ev_0004') }} as p
