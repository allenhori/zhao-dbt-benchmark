select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v5 / 13.0, 4) as v1,
    round(p.v5 / 3.0, 4) as v2,
    p.v5 - p.v4 as v3,
    p.v5 - p.v4 as v4,
    round(p.v4 / 13.0, 4) as v5,
    case when p.v4 > p.v5 then p.v4 else p.v5 end as v6,
    round(p.v4 / 3.0, 4) as v7
from {{ ref('int_ev_0023') }} as p
